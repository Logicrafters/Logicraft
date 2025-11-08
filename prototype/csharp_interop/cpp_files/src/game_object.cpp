//
// Created by charles on 08/11/2025.
//

#include "game_object.h"

#include <ranges>
#include <algorithm>
#include <iostream>

game_object::game_object(std::string_view _name)
    : m_name(_name)
{}

game_object::game_object(const game_object& other)
    : m_name(other.m_name)
{
    copy_components(other);
}

game_object::~game_object()
{
    std::cout << "game object destroyed\n";
}

game_object& game_object::operator=(const game_object& other)
{
    if (this == &other)
    {
        return *this;
    }

    m_components.clear();

    m_name = other.m_name;
    copy_components(other);

    return *this;
}

void game_object::start()
{
    for (sptr_component_t& component: m_components)
    {
        component->start();
    }
}

void game_object::update()
{
    for (sptr_component_t& component: m_components)
    {
        component->update();
    }
}

component& game_object::add_component(void* _gc_handle)
{
    auto new_components{std::make_shared<component>(_gc_handle)};
    m_components.emplace_back(new_components);
    return *new_components;
}

void game_object::copy_components(const game_object &other)
{
    auto transform_operation{[](const sptr_component_t& _component)
    {
        return std::make_shared<component>(*_component);
    }};

    const std::vector<sptr_component_t>& other_components{other.m_components};
    std::ranges::transform(other_components.cbegin(), other_components.cend(), m_components.begin(), transform_operation);
}

void* add_component(void* _internal_game_object, void* _gc_handle)
{
    const auto casted_internal_gm{static_cast<game_object*>(_internal_game_object)};
    component& new_component{casted_internal_gm->add_component(_gc_handle)};
    new_component.start();

    return &new_component;
}